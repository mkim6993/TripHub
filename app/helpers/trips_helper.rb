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
    
    def get_loc_info(id)
        trip_location = TripLocation.find_by(id: id)
        location = Location.find_by(id: trip_location.location_id)
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

end
