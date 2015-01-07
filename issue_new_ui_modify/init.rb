require 'redmine'

#Hooks 
require_dependency 'issue_new_ui_modify/view_issues_new_top_hook_listener'
require_dependency 'issue_new_ui_modify/view_issues_history_journal_bottom_hook_listener'
require_dependency 'issue_new_ui_modify/view_issues_show_details_bottom_hook_listener'
require_dependency 'issue_new_ui_modify/view_issues_form_details_bottom_hook_listener'
require_dependency 'issue_new_ui_modify/view_timelog_edit_form_bottom_hook_listener'


#Patches to the Redmine Core, Will not work in developement mode
require_dependency 'issue_new_ui_modify/issues_helper_patch'
require_dependency 'issue_new_ui_modify/issues_controller_patch'
require_dependency 'issue_new_ui_modify/timelog_controller_patch'



Redmine::Plugin.register :issue_new_ui_modify do
  name 'Issue New Ui Modify plugin. '
  author 'nmgfrank'
  description ' 1. It hides and shows the closed sub issues. 2.It simplifies the way that we input watchers. 3. It adds timestamps on journals. 4. It adds << Author >> into the assigned to selection. '
  version '0.0.1'
  url 'http://nmgfrankblog.sinaapp.com/'
  author_url 'http://nmgfrankblog.sinaapp.com/'
  
  project_module :time_tracking do
    permission :view_ticket_time_entries,{}
    permission :view_self_ticket_time_entries,{}
    permission :view_time_entries_report,{}
  end
  
  
end




