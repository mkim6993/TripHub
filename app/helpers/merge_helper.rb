module MergeHelper
    def getMostPopularRelated(trip)  
        all_related = get_all_children(trip.id, []).append(trip)
        all_related.sort_by{|t| -1*get_likes(t)}.first(5)
    end
        
    def get_all_children(trip_id, child_arr)
        children = Trip.where(parent: trip_id)
        while children.length != 0
            child_arr += children
            children = Trip.where(parent: children.ids)
        end
        child_arr
    end
end