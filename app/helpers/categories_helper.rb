module CategoriesHelper
  def find_son_catogries
    Category.find_son_categories
  end
end
