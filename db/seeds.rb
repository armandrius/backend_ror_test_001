# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.delete_all
Movie.delete_all
Season.delete_all
Episode.delete_all
Purchase.delete_all
PurchaseOption.delete_all

movies = Movie.create!([
  {
    title: 'The Shawshank Redemption',
    plot: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'
  },
  {
    title: 'The Godfather',
    plot: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'
  },
  {
    title: 'The Godfather II',
    plot: 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.'
  },
  {
    title: 'The Dark Knight',
    plot: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.'
  },
  {
    title: '12 Angry Men',
    plot: 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.'
  },
  {
    title: "Schindler's List",
    plot: 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.'
  },
  {
    title: 'The Lord of the Rings: The Return of the King',
    plot: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."
  },
  {
    title: 'Pulp Fiction',
    plot: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'
  }
])

breaking_bad_seasons = Season.create!([
  {
    title: 'Breaking Bad Season 1',
    plot: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.",
    number: 0
  },
  {
    title: 'Breaking Bad Season 2',
    plot: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.",
    number: 1
  },
])

bb_1_episodes = breaking_bad_seasons[0].episodes.create!([
  {
    title: 'Pilot',
    plot: 'Diagnosed with terminal lung cancer, chemistry teacher Walter White teams up with former student Jesse Pinkman to cook and sell crystal meth.',
    number: 0
  },
  {
    title: "Cat's in the Bag...",
    plot: "After their first drug deal goes terribly wrong, Walt and Jesse are forced to deal with a corpse and a prisoner. Meanwhile, Skyler grows suspicious of Walt's activities.",
    number: 1
  },
  {
    title: "...And the Bag's in the River",
    plot: "Walt and Jesse clean up after the bathtub incident before Walt decides what course of action to take with their prisoner Krazy-8.",
    number: 2
  }
])

bb_2_episodes = breaking_bad_seasons[1].episodes.create!([
  {
    title: 'Seven Thirty-Seven',
    plot: 'Walt and Jesse realize how dire their situation is. They must come up with a plan to kill Tuco before Tuco kills them first.',
    number: 0
  },
  {
    title: "Grilled",
    plot: "Walt's disappearance is met with investigation by both his wife and Hank, as Tuco Salamanca intends to leave town with his kidnapped cooks.",
    number: 1
  },
  {
    title: "Bit by a Dead Bee",
    plot: "Walt and Jesse try to come up with alibis for their disappearances.",
    number: 2
  }
])

game_of_thrones_seasons = Season.create!([
  {
    title: "Game of Thrones Season 1",
    plot: "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.",
    number: 0
  },
  {
    title: "Game of Thrones Season 2",
    plot: "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.",
    number: 1
  }
])

got_1_episodes = game_of_thrones_seasons[0].episodes.create!([
  {
    title: "Winter is Coming",
    plot: "Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army.",
    number: 0
  },
  {
    title: "The Kingsroad",
    plot: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.",
    number: 1
  },
  {
    title: "Lord Snow",
    plot: "Jon begins his training with the Night's Watch; Ned confronts his past and future at King's Landing; Daenerys finds herself at odds with Viserys.",
    number: 2
  }
])

got_2_episodes = game_of_thrones_seasons[1].episodes.create!([
  {
    title: "The North Remembers",
    plot: "Tyrion arrives at King's Landing to take his father's place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night's Watch arrive at the house of Craster.",
    number: 0
  },
  {
    title: "The Night Lands",
    plot: "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.",
    number: 1
  },
  {
    title: "What is Dead my Never Die",
    plot: "Tyrion tries to see who he can trust in the Small Council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb.",
    number: 2
  }
])

users = User.create!([
  {
    email: 'first.user@example.com'
  },
  {
    email: 'second.user@example.com'
  }
])

Movie.all.each do |movie|
  price = (rand * 10).round(2) + 2
  %w[HD SD].each do |video_quality|
    movie.purchase_options.create! price: price * ( video_quality == 'HD' ? 1.5 : 1.0 ), video_quality: video_quality
  end
end

Season.all.each do |season|
  price = (rand * 50).round(2) + 10
  %w[HD SD].each do |video_quality|
    season.purchase_options.create! price: price * ( video_quality == 'HD' ? 1.5 : 1.0 ), video_quality: video_quality
  end
end

purchases = users.first.purchases.create!([
  { purchase_option: game_of_thrones_seasons.last.purchase_options.first },
  { purchase_option: breaking_bad_seasons.first.purchase_options.second },
  { purchase_option: movies.last.purchase_options.first },
  { purchase_option: movies.first.purchase_options.second }
])

purchases.each do |purchase|
  purchase.update_columns expires_at: (1 + rand).days.from_now
end

purchases.last.update_columns(created_at: 3.days.ago, expires_at: 1.day.ago)
