module IssueNewUIModify
    class ViewIssuesShowDetailsBottomHookListener < Redmine::Hook::ViewListener
        def view_issues_show_details_bottom(context={}) 
            context[:controller].send(:render_to_string, {
                :partial => "hook/issue_new_ui_modify/view_issues_show_details_bottom_hook",
                :locals => context  
            })    
        end

    end
end
