module IssueNewUIModify
    class ViewIssuesHistoryJournalBottomHookListener < Redmine::Hook::ViewListener
        def view_issues_history_journal_bottom(context={}) 
            journal = context[:journal]
            context[:controller].send(:render_to_string, {
                :partial => "hook/issue_new_ui_modify/view_issues_history_journal_bottom",
                :locals => {:journal => journal} 
            })    
        end

    end
end
