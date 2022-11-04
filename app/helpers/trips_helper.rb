module TripsHelper
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

    def make_tree(id)
        recurse(id, "")
    end
end
