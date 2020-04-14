# require modules here
require "yaml"
require "pry"
emoticon_library = YAML.load_file('./lib/emoticons.yml')

def load_library (filepath)
  emoticon_library = YAML.load_file(filepath)
  emoticon_library.each do |emotion, emoticons|
    emoticons.insert(0,'english'.to_sym)
    emoticons.insert(-2,'japanese'.to_sym)
    emoticon_library[emotion] = Hash[*emoticons]
  end
  emoticon_library
end

def get_english_meaning(emoticon_library, emoticon_input)
  lib = load_library(emoticon_library)
  lib.each do |emotion, emoticons|
    if emoticon_input == emoticons[:japanese]
      return emotion
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(filepath, emoticon_input)
  lib = load_library(filepath)
  lib.each do |emotion, emoticons|
    if emoticon_input == emoticons[:english]
      return emoticons[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
