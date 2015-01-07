require_dependency 'issues_controller'

module IssueNewUIModify
    module IssuesControllerPatch
        def self.included(base)
            base.send(:include, InstanceMethods)
            base.class_eval do 
                before_filter :find_issue, :only => [:show, :edit, :update]
                before_filter :find_project, :only => [:new, :create, :update_form,:assignee_new,:autocomplete_for_assignable,:append_assignee]
                before_filter :authorize, :except => [:index,:assignee_new,:autocomplete_for_assignable,:append_assignee,:index_excel]
                before_filter :build_new_issue_from_params, :only => [:new, :create, :update_form,:assignee_new,:autocomplete_for_assignable,:append_assignee]
            end
        end

        module InstanceMethods
            def append_assignee
                if !params['assignables'].nil?
                    @assignee_user_id = params['assignables']
                else
                    @assignee_user_id = nil
                end
                render :layout => false
                
            end

            def assignee_new
                render :template => "issues/new_modify"
            end

            def autocomplete_for_assignable
                @all_users = User.active.sorted.like(params[:q]).all
                @pro_users = @issue.assignable_users
                pro_user_ids = @pro_users.collect {|x| x.id}
        
                @users = @all_users.select {|x| pro_user_ids.include?(x.id) }
                
                render :layout => false
            end
        end


    end
end
IssuesController.send(:include, IssueNewUIModify::IssuesControllerPatch)
