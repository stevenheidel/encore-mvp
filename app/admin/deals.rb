ActiveAdmin.register Deal do
  belongs_to :concert
  navigation_menu :concert
end