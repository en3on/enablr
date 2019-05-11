desc 'This task manages checking the end of projects'
task end_projects: :environment do
  puts 'Checking for finished projects'

  finished_projects = Project.all.select do |project|
    project.target_date <= Date.today
  end

  finished_projects.each do |project|

    enablrs = project.project_enablrs.all

    enablrs.each do |enablr|
      user = User.find(enablr.user_id)
      EnablrMailer.with(user: user, enablr: enablr).project_end_email.deliver_now
    end

    Project.destroy(project.id)
    puts "Ending project #{project.name}"
  end

  puts 'Finished ending projects'
end

