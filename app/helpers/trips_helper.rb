module TripsHelper

  def month_collector
    months = (1..12).to_a
    return months
  end

  def day_collector
    days = (1..31).to_a
    return days
  end

  def year_collector
    years = (1900..2023).to_a
    return years
  end

    def recurse(id, tree_str)
        cur_children = Trip.get_children(id)
        if cur_children.length != 0
            tree_str << "<ul>\n"
            cur_children.each do |child| 
                tree_str << "<li><span>" << '<a href="/trips/' << child.id.to_s << '">' << child.title << "</a></span>\n"
                recurse(child.id, tree_str)
            end
            tree_str << "</li>\n"
            tree_str << "</ul>\n"
        end
    end

    def get_original_parent(id)
        parent_id = Trip.find_by(id: id).parent
        if parent_id != -1
            get_original_parent(parent_id)
        else
            id
        end
    end

    def make_tree(id)
        recurse(id, "")
    end

    def create_child(parent)
        child = parent.amoeba_dup
        child.parent = parent.id
        child.title = parent.title << " copy"
        child.public = false
        child.save
        child
    end
    
    # return location information given location_id
    def get_loc_info(location_id)
        location = Location.find_by(id: location_id)
        return location
    end

    def liked?(trip)
      like = Like.where(user:current_user, trip: Trip.find(trip.id))
      if like.empty?
        return true
      else
        return false
      end
    end

    def get_likes(trip)
      Like.where(trip: Trip.find(trip.id)).count
    end

    # return date in human readable form
    def convert_date(date)
        readable_date = ""
        date_string = date.to_s.gsub!("-", "")
        year = date_string[0..3]
        month = date_string[4..5]
        day = date_string[6..7]
        puts "----------------------"
        puts DateTime.now.strftime "%Y"
        if month[0] == "0"
            month = month[1]
            if month == "1"
                readable_date += "January "
            elsif month == "2"
                readable_date += "Feburary "
            elsif month == "3"
                readable_date += "March "
            elsif month == "4"
                readable_date += "April "
            elsif month == "5"
                readable_date += "May "
            elsif month == "6"
                readable_date += "June "
            elsif month == "7"
                readable_date += "July "
            elsif month == "8"
                readable_date += "August "
            else
                readable_date += "September "
            end
        else
            puts "-----------------------------"
            if month == "10"
                readable_date += "October "
            elsif month == "11"
                readable_date += "November "
            else
                readable_date += "December "
            end
        end

        if day[0] == "0"
            day = day[1]
            readable_date += day + ", "
        else
            readable_date += day + ", "
        end

        readable_date += year
    end

    def invited_users(trip_id, root_user_id)
        trip_users = TripUser.where(trip_id: trip_id).to_a
        userids = []
        trip_users.each do | tu |
            userids.append(tu.user_id)
        end
        puts "##############"
        usernames = "<div>"
        userids.each do | id |
            user = User.find_by(id: id).username
            if user != root_user_id
                usernames << " @" << user 
            end
        end
        usernames << "</div>"
        return raw(usernames)
    end

    def usersearch(search)
        user = User.where("username LIKE ?", "%#{search}%")
        respond_to do |format|
          format.html { redirect_to users_path, notice: "Article was successfully updated." }
        end
    end

    def belong_to_user?(user_id, trip_id)
        trip = Trip.find_by(id: trip_id)
        user = User.find_by(id: user_id)

        if trip.create_by == user.username
            return true
        else
            return false
        end
    end
    
    def convert_time(time)
        hours, minutes = time.split(":")
        hours = hours.to_i
        if hours > 12
            return (hours-12).to_s + ":" + minutes + " PM"
        end
        return hours.to_s + ":" + minutes + " AM"
    end

end
