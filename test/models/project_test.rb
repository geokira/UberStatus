require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
    def setup
        @project = Project.new(name: "Absolute Value for Pricing", project_number_str: "174523", project_description: "This project will provide the absolute value a customer will pay for product.")
    end
    
    test "should be valid" do
        assert @project.valid?
    end
    
    test "project name should be present" do
        @project.name = "   "
        assert_not @project.valid?
    end
    
    test "project number_str should be present" do
        @project.project_number_str = "   "
        assert_not @project.valid?
    end
    
    test "name should not be too long" do
        @project.name = "a" * 66
        assert_not @project.valid?
    end
    
    test "project name and number should be unique" do
        duplicate_project = @project.dup
        duplicate_project.name = @project.name.upcase
        @project.save
        assert_not duplicate_project.valid?
    end
    
    test "associated systems should be destroyed" do
        @project.save
        @project.systems.create!(profile: "SRS-PFI")
        assert_difference 'System.count', -1 do
            @project.destroy
        end
    end
  # test "the truth" do
  #   assert true
  # end
end
