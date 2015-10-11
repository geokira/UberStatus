require 'test_helper'

class ProjectCreationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid project creation information" do
    get new_project_path
    assert_no_difference 'Project.count' do
      post projects_path, project: {name: "",
        project_number_str: ""}
    end
    assert_template 'projects/new'
  end


end
