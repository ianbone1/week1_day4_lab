require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../friends' )
require("pry")

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Shaggy",
      age: 12,
      monies: 1,
      friends: ["Velma","Fred","Daphne", "Scooby"],
      favourites: {
        tv_show: "Friends",
        snacks: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Velma",
      age: 15,
      monies: 2,
      friends: ["Fred"],
      favourites: {
        tv_show: "Baywatch",
        snacks: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Scooby",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma"],
      favourites: {
        tv_show: "Pokemon",
        snacks: ["Scooby snacks"]
      }
    }

    @person4 = {
      name: "Fred",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma", "Daphne"],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spaghetti", "ratatouille"]
      }
    }

    @person5 = {
      name: "Daphne",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Daphne", result)
  end

  # 2. For a given person, return their favourite tv show
  # (e.g. the function favourite_tv_show(@person2) should return the string "Baywatch")

  def test_favourite_tv_show
    expected = "Baywatch"
    actual = favourite_tv_show(@person2)
    assert_equal(expected, actual)
  end

  # 3. For a given person, check if they like a particular food
  # (e.g. the function likes_to_eat(@person2, "bread") should return true, likes_to_eat(@person3, "spinach") should return false)

  def test_likes_to_eat__bread
    expected = true
    actual = likes_to_eat(@person2, "bread")
    assert_equal(expected, actual)
  end

  def test_likes_to_eat__spinach
    expected = false
    actual = likes_to_eat(@person3, "spinach")
    assert_equal(expected, actual)
  end

  # 4. For a given person, add a new name to their list of friends
  # (e.g. the function add_friend(@person2, "Scrappy-Doo") should add Scrappy-Doo to the friends.)
  # (hint: This function should not return anything. After the function call, check for the length of the friends array to test it!)


  def test_add_friend__nil
    assert_nil(add_friend(@person2, "Scrappy-Doo"))
  end


  def test_add_friend
    size1 = @person2[:friends].count
    actual = add_friend(@person2, "Scrappy-Doo")
    size2 = @person2[:friends].count
    expected = size1 + 1
    assert_equal(expected, size2)
  end

  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)

  def test_remove_friend
    size1 = @person1[:friends].count
    actual = remove_friend(@person1, "Daphne")
    size2 = @person1[:friends].count
    expected = size1 - 1
    assert_equal(expected, size2)
  end


  # 6. Find the total of everyone's money
  # (hint: use the @people array, remember how we checked the total number of eggs yesterday?)

  def test_total_monies
    expected = 143
    actual = total_monies(@people)
    assert_equal(expected, actual)
  end


  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: our function will probably need 3 arguments passed to it... the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed, maybe two assertions?)

  def test_lender_money
    money = 55
    lender_current_total = @person5[:monies]
    lendee_current_total = @person4[:monies]
    trans = transaction(@person5, @person4, money)
    lender_new_total = @person5[:monies]
    lendee_new_total = @person4[:monies]
    expected = lender_current_total - money
    actual = lender_new_total
    assert_equal(expected, actual)
  end

  def test_lendee_money
    money = 55
    lender_current_total = @person5[:monies]
    lendee_current_total = @person4[:monies]
    trans = transaction(@person5, @person4, money)
    lender_new_total = @person5[:monies]
    lendee_new_total = @person4[:monies]
    expected = lendee_current_total + money
    actual = lendee_new_total
    assert_equal(expected, actual)
  end

  # 8. Find the set of everyone's favourite food joined together
  # (hint: concatenate the favourites/snack arrays together)

  def test_favourite_foods
    expected = 7
    actual = favourite_foods(@people).count()
    assert_equal(expected, actual)
  end


  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)

  def test_friends_list
    expected = ["Daphne"]
    actual = friends_list(@people)
    assert_equal(expected, actual)
  end

end
