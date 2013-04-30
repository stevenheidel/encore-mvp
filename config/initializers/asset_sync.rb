AssetSync.configure do |config|
  config.fog_provider = "AWS"
  config.aws_access_key_id = "AKIAJOHMP34BPPTZH47A"
  config.aws_secret_access_key = "2AVi33jv1otZ9wElbf1LrAthBM44CgFTz1kixk7/"
  config.fog_directory = "encoremvp-assets"
  
  # Increase upload performance by configuring your region
  # config.fog_region = 'eu-west-1'
  #
  # Delete files from the store
  config.existing_remote_files = "delete"
  #
  # Automatically replace files with their equivalent gzip compressed version
  config.gzip_compression = true
  #
  # Use the Rails generated 'manifest.yml' file to produce the list of files to 
  # upload instead of searching the assets directory.
  # config.manifest = true
  #
  # Fail silently.  Useful for environments such as Heroku
  # config.fail_silently = true
end if defined?(AssetSync)
