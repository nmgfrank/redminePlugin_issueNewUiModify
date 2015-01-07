module IssueNewUIModify
    class ViewIssuesFormDetailsHookListener < Redmine::Hook::ViewListener
        def view_issues_form_details_bottom(context={}) 
            context[:controller].send(:render_to_string, {
                :partial => "hook/issue_new_ui_modify/view_issues_form_details_bottom",
                :locals => {} 
            })    
        end
    end
end
