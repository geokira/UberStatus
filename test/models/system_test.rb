require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = Project.new(name: "ADTP4", project_number_str: "155275")
    @system = System.new(profile: "SRS-IPAR", project_id: @project.id)
  end

  test "should be valid" do
    assert @system.valid?
  end

  test "project id should be present" do
    @system.project_id = nil
    assert_not @system.valid?
  end
end
