og_id = Trip.create(create_by: "CF", trip_date: DateTime.now, title: "socrates", description: "why?", upvotes: 1, shares: 0, public: true, parent:0).id
child1 = Trip.create(create_by: "MSK", trip_date: DateTime.now, title: "confusious", description: "how?", upvotes: 1, shares: 0, public: true, parent:og_id).id
child2 = Trip.create(create_by: "JT", trip_date: DateTime.now, title: "decarte", description: "what?", upvotes: 1, shares: 0, public: true, parent:og_id).id
gchild1 = Trip.create(create_by: "CF", trip_date: DateTime.now, title: "Roe Jogan", description: "cringe?", upvotes: 1, shares: 0, public: true, parent:child1).id
gchild2 = Trip.create(create_by: "MSK", trip_date: DateTime.now, title: "Peter", description: "lois?", upvotes: 1, shares: 0, public: true, parent:child1).id
gchild3 = Trip.create(create_by: "JT", trip_date: DateTime.now, title: "post", description: "kek?", upvotes: 1, shares: 0, public: true, parent:child2).id
gchild4 = Trip.create(create_by: "HC", trip_date: DateTime.now, title: "momma", description: "jo?", upvotes: 1, shares: 0, public: true, parent:child2).id
gchild5 = Trip.create(create_by: "CF", trip_date: DateTime.now, title: "no", description: "u?", upvotes: 1, shares: 0, public: true, parent:child2).id
gchild6 = Trip.create(create_by: "MSK", trip_date: DateTime.now, title: "trip", description: "hub?", upvotes: 1, shares: 0, public: true, parent:gchild4).id


puts og_id