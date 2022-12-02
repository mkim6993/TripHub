module StarFansHelper

  def following?(user)
    relation = StarFan.where(star: User.find(user.id), fan: current_user)
    if relation.empty?
      return true
    else
      return false
    end
  end


end
