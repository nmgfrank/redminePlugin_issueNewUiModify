module IssueNewUIModify
    class ViewIssuesNewTopHookListener < Redmine::Hook::ViewListener
        def view_issues_new_top(context={}) 
            context[:controller].send(:render_to_string, {
                :partial => "hook/issue_new_ui_modify/view_issues_new_top",
                :locals => context  
            })    
        end

    end
end
