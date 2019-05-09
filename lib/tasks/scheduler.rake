desc 'This task manages checking the end of projects'
task end_projects: :environment do
  puts 'Checking for finished projects'

  finished_projects = Project.all.select do |project|
    project.target_date <= Date.today
  end

  finished_projects.each do |project|
    Project.destroy(project.id)
    puts "Ending project #{project.name}"
  end

  puts 'Finished ending projects'
end

