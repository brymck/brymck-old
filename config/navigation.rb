# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.items do |primary|
    primary.dom_class = "inline"
    primary.item :home, t(:home), root_path
    primary.item :about, t(:about), about_path

    if current_user
      if current_user.admin?
        primary.item :new_post, t(:new, :scope => :posts), new_post_path
        primary.item :users, t(:index, :scope => :users), users_path
      end

      primary.item :signout, t(:signout), signout_path
    else
      primary.item :google_apps, t(:google_apps), "auth/google_apps"
      primary.item :twitter, t(:twitter), "auth/twitter"
    end
    # primary.item :users, t(:users), users_path

    # Add an item which has a sub navigation (same params, but with block)
    # primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
      # sub_nav.item :key_2_1, 'name', url, options
    # end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    # primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    # primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  end
end
