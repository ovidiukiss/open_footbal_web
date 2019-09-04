require 'csv'
namespace :csv_generate do
  task :generate_csv do
    puts 'Please wait, generating CSV...'
    def flat_it(array)
      array.flat_map { |q| q }
    end

    def return_key(object)
      object.attributes.keys
    end

    def return_value(object)
      object.attributes.values
    end

    def create_csv
      all_teams = Team.all.includes(:trainer, :players)
      CSV.open('export_teams.csv', 'w+') do |file|
        all_teams.each_with_index do |team, index|
          each_row = []
          headers = []
          if index.zero?
            headers << return_key(team)
            headers << return_key(team.trainer)
            headers << return_key(team.players.first)
            file.puts(flat_it(headers))
          end
          each_row << return_value(team)
          each_row << return_value(team.trainer)
          team.players.each do |player|
            each_row << return_value(player)
            file.puts(flat_it(each_row))
          end
        end
      end
    end
    puts 'CSV generation complete'
  end
end
