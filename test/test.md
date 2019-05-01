Run options: --seed 11495

# Running:

.....E

Error:
ProjectsControllerTest#test_should_create_new_software_project:
CanCan::AccessDenied: You are not authorized to access this page.
    test/controllers/projects_controller_test.rb:33:in `block in <class:ProjectsControllerTest>'

bin/rails test test/controllers/projects_controller_test.rb:27

E

Error:
ProjectsControllerTest#test_should_get_new_project:
CanCan::AccessDenied: You are not authorized to access this page.
    test/controllers/projects_controller_test.rb:72:in `block in <class:ProjectsControllerTest>'

bin/rails test test/controllers/projects_controller_test.rb:71

..F

Failure:
ProjectsControllerTest#test_standard_user_can't_create_project [/home/en3on/coding/fasttrack/rails/projects/enablr/test/controllers/projects_controller_test.rb:142]:
Standard user was allowed to create project.
Expected: 0
  Actual: 1

bin/rails test test/controllers/projects_controller_test.rb:138

E

Error:
ProjectsControllerTest#test_should_delete_project:
CanCan::AccessDenied: You are not authorized to access this page.
    test/controllers/projects_controller_test.rb:110:in `block (2 levels) in <class:ProjectsControllerTest>'
    test/controllers/projects_controller_test.rb:109:in `block in <class:ProjectsControllerTest>'

bin/rails test test/controllers/projects_controller_test.rb:103

E

Error:
ProjectsControllerTest#test_should_change_project_name:
CanCan::AccessDenied: You are not authorized to access this page.
    test/controllers/projects_controller_test.rb:127:in `block in <class:ProjectsControllerTest>'

bin/rails test test/controllers/projects_controller_test.rb:117

.E

Error:
ProjectsControllerTest#test_should_get_edit_project:
CanCan::AccessDenied: You are not authorized to access this page.
    test/controllers/projects_controller_test.rb:82:in `block in <class:ProjectsControllerTest>'

bin/rails test test/controllers/projects_controller_test.rb:77



Finished in 0.607371s, 23.0502 runs/s, 13.1715 assertions/s.
14 runs, 8 assertions, 1 failures, 5 errors, 0 skips
