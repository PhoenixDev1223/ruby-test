require "test_helper"

class ApiClientFunTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ApiClientFun::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  # Feel free to change this.
  def test_returns_profile
    profile = ApiClientFun.profile_for_name('Philip J Fry')
    expected_profile = { age: 25, gender: "M", planet: "Earth", species: "Human", status: "Alive" }
    assert_equal(expected_profile, profile)
  end
end
