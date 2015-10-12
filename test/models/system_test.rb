require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = projects(:ADTP4)
    @project.save
    @system = @project.systems.build(profile: "SRS-RPAR")
  end

  test "should be valid" do
      assert @system.valid?
  end

  test "project id should be present" do
    @system.project_id = nil
      assert_not @system.valid?
  end

    test "profile should be present" do
        @system.profile = "   "
        assert_not @system.valid?
    end

    test "profile should be at most 65 characters" do
        @system.profile = "a" * 66
        assert_not @system.valid?
    end

    test "order should be most recent first" do
        assert_equal systems(:most_recent), System.first
    end
end
