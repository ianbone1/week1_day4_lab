def get_name(person)
  return person[:name]
end

def favourite_tv_show(person)
  return person[:favourites][:tv_show]
end

def likes_to_eat(person, snack_to_check)
  for snack in person[:favourites][:snacks]
    return true if snack == snack_to_check
  end
  return false
end

def add_friend(person, new_friend)
  person[:friends] << new_friend
  return nil
end

def remove_friend(person, old_friend)
  person[:friends].delete(old_friend)
  return nil
end

def total_monies(they_are_the_people)
  total_cash = 0
  for person in they_are_the_people
    total_cash += person[:monies]
  end
  return total_cash
end

def transaction(lender, lendee, money)
  lender[:monies] -= money
  lendee[:monies] += money
  return nil
end

def favourite_foods(they_are_the_people)
  snack_list = []

  for person in they_are_the_people
    snack_list += person[:favourites][:snacks]
  end
  return snack_list
end

def friends_list(they_are_the_people)
  result = []
  for person in they_are_the_people
    #binding.pry
    if person[:friends].count == 0
      result << person[:name]
    end
  end
  return result
end
