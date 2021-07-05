require 'pry'
require 'yaml'

def load_library(file_path)
  response = {}
    library = YAML.load_file(file_path)
    library.each do |names, emoticons|
      response[names] = {:english => "#{emoticons[0]}", :japanese => "#{emoticons[1]}"}
        end
        response
  end

def get_japanese_emoticon(file_path,emoticon)
  library = load_library(file_path)
  response = nil
  library.each do |name, emoticons|
    english = emoticons[:english]
    japanese = emoticons[:japanese]
    if emoticon == english
      response = japanese
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end

def get_english_meaning(file_path,emoticon)
  library = load_library(file_path)
  response = nil
  library.each do |name, emoticons|
    english = name
    japanese = emoticons[:japanese]
    if emoticon == japanese
      response = name
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end
