# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match '/projects/:project_id/issues/assignee_new', :to => 'issues#assignee_new', :via => [:get, :post]
match '/projects/:project_id/issues/autocomplete_for_assignable', :to => 'issues#autocomplete_for_assignable', :via => [:get, :post]

match '/projects/:project_id/issues/append_assignee', :to => 'issues#append_assignee', :via => [:get, :post]

match '/projects/:project_id/issues/:issue_id/time_entries_panel', :to => 'timelog#panel', :via => [:get, :post]
