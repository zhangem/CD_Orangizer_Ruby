require "./lib/cd"

def main_menu
  system('clear')
  puts "Welcome to your CD library!"
  puts "Enter 'a' to add a new CD."
  puts "Enter 'l' to list out CD catalog."
  puts "Enter 's' to search your catalog."
  puts "Enter 'x' to exit."
  case gets.chomp[0].downcase
  when 'a'
    add_menu
  when 'l'
    list_menu
  when 's'
    search_menu
  when 'x'
    exit
  else
    puts "That is not a valid command!"
    main_menu
  end
end

def add_menu
  system('clear')
  puts "Enter the name of the artist:"
  user_band = gets.chomp
  puts "Enter the name of the album:"
  user_album = gets.chomp
  puts "Enter the year of the album:"
  user_year = gets.chomp
  puts "Enter the genre of the album:"
  user_genre = gets.chomp
  new_cd = CD.create({:band => user_band, :album => user_album, :year => user_year, :genre => user_genre})
  system('clear')
  puts "Here is the album that was added:"
  puts "Artist: " + new_cd.band
  puts "Album: " + new_cd.album
  puts "Year: " + new_cd.year
  puts "Genre: " + new_cd.genre
  puts "\n"
  puts "Enter 'a' to add another album."
  puts "Enter 'x' to go back to the main menu."
  case gets.chomp[0].downcase
  when 'a'
    add_menu
  when 'x'
    main_menu
  else
    puts "That is not a valid command!"
    add_menu
  end
end

def list_menu
  system('clear')
  puts "%-7s" % ["Index"] + "%-18s" % ["Artist"] + "%-25s" % ["Album"] + "%-7s" % ["Year"] + "%-15s" % ["Genre"]
  CD.all.each_with_index do |album, index|
    puts "%-7s" % [(index+1).to_s + ":"] + "%-18s" % [album.band] + "%-25s" % [album.album] + "%-7s" % [album.year] + "%-15s" % [album.genre]
  end
  puts "Enter 'x' to go back to the main menu."
  gets.chomp
  main_menu
end

def search_menu
  system('clear')
  puts "Enter 'a' to search by Artist."
  puts "Enter 'n' to search by Album Name."
  puts "Enter 'y' to search by Year."
  puts "Enter 'g' to search by Genre."
  puts "Enter 'x' to go back to main menu."
  case gets.chomp[0].downcase
  when 'a'
    puts "What artist are you searching for?"
    input_artist = gets.chomp
    found_artist = CD.search("band", input_artist)
    if found_artist == false
      puts "Artist not found."
      puts "Press any key to search again."
      gets.chomp
      search_menu
    else
      puts "%-7s" % ["Index"] + "%-18s" % ["Artist"] + "%-25s" % ["Album"] + "%-7s" % ["Year"] + "%-15s" % ["Genre"]
      found_artist.each_with_index do |album, index|
      puts "%-7s" % [(index+1).to_s + ":"] + "%-18s" % [album.band] + "%-25s" % [album.album] + "%-7s" % [album.year] + "%-15s" % [album.genre]
      end
    end
    puts "\n"
    puts "Press any key to go back to the search menu."
    gets.chomp
    search_menu
  when 'n'
    puts "What album are you searching for?"
    input_album = gets.chomp
    found_album = CD.search("album", input_album)
    if found_album == false
      puts "Album not found."
      puts "Press any key to search again."
      gets.chomp
      search_menu
    else
      puts "%-7s" % ["Index"] + "%-18s" % ["Artist"] + "%-25s" % ["Album"] + "%-7s" % ["Year"] + "%-15s" % ["Genre"]
      found_album.each_with_index do |album, index|
      puts "%-7s" % [(index+1).to_s + ":"] + "%-18s" % [album.band] + "%-25s" % [album.album] + "%-7s" % [album.year] + "%-15s" % [album.genre]
      end
    end
    puts "\n"
    puts "Press any key to go back to the search menu."
    gets.chomp
    search_menu
  when 'y'
    puts "Enter year of the album."
    input_year = gets.chomp
    found_year = CD.search("year", input_year)
    if found_year == false
      puts "Year not found."
      puts "Press any key to search again."
      gets.chomp
      search_menu
    else
      puts "%-7s" % ["Index"] + "%-18s" % ["Artist"] + "%-25s" % ["Album"] + "%-7s" % ["Year"] + "%-15s" % ["Genre"]
      found_year.each_with_index do |album, index|
      puts "%-7s" % [(index+1).to_s + ":"] + "%-18s" % [album.band] + "%-25s" % [album.album] + "%-7s" % [album.year] + "%-15s" % [album.genre]
      end
    end
    puts "\n"
    puts "Press any key to go back to the search menu."
    gets.chomp
    search_menu
  when 'g'
    puts "What genre are you searching for?"
    input_genre = gets.chomp
    found_genre = CD.search("genre", input_genre)
    if found_genre == false
      puts "Genre not found."
      puts "Press any key to search again."
      gets.chomp
      search_menu
    else
      puts "%-7s" % ["Index"] + "%-18s" % ["Artist"] + "%-25s" % ["Album"] + "%-7s" % ["Year"] + "%-15s" % ["Genre"]
      found_genre.each_with_index do |album, index|
      puts "%-7s" % [(index+1).to_s + ":"] + "%-18s" % [album.band] + "%-25s" % [album.album] + "%-7s" % [album.year] + "%-15s" % [album.genre]
      end
    end
    puts "\n"
    puts "Press any key to go back to the search menu."
    gets.chomp
    search_menu
  when 'x'
    main_menu
  else
    puts "That is not a valid command!"
    add_menu
  end
end

main_menu
