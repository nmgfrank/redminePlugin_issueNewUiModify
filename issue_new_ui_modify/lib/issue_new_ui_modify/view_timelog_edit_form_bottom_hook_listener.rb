module IssueNewUIModify
    class ViewTimelogEditFormBottomHookListener < Redmine::Hook::ViewListener
        def view_timelog_edit_form_bottom(context={}) 
            context[:controller].send(:render_to_string, {
                :partial => "hook/issue_new_ui_modify/view_timelog_edit_form_bottom",
                :locals => {} 
            })    
        end
    end
end
