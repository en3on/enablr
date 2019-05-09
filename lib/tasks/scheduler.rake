desc "This task manages checking the end of projects"
task :end_projects => :environment do
  puts 'Checking for finished projects'

  finished_projects = Project.all.select do |project|
    project.target_date <= Date.today
  end

  Project.end(finished_projects)

  puts 'Finished ending projects'
end

