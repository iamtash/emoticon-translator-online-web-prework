require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons_data = YAML.load_file(file_path)
  get_meaning = {}
  get_emoticon = {}
  emoticons_data.each {|meaning, emoticons|
    get_meaning[emoticons[1]] = meaning
    get_emoticon[emoticons[0]] = emoticons[1]
  }
  emoticons = {'get_meaning' => get_meaning, 'get_emoticon' => get_emoticon}
  emoticons

end

def get_japanese_emoticon(file_path, emoticon)
  #binding.pry
  japanese_emoticon = load_library(file_path)['get_emoticon'][emoticon]
  #binding.pry
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  english_meaning = load_library(file_path)['get_meaning'][emoticon]
  english_meaning ? english_meaning : "Sorry, that emoticon was not found"
end
