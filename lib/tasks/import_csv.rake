require "csv"

namespace :import_csv do
  desc "csvデータをインポートするタスク"

    task members: :environment do
      path = "db/csv_data/csv_data.csv"
      list = []
      CSV.foreach(path, headers: true) do |row|
        list << row.to_h
      end
      puts "インポート処理を開始"
      begin
        Member.transaction do
          Member.create!(list)
        end
        puts "インポート完了"
      rescue StandardError => e
        puts "#{e.class}: #{e.message}"
        puts "-------------------------"
        puts e.backtrace
        puts "-------------------------"
        puts "インポートに失敗"
      end
    end
end
