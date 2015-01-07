require_dependency 'issues_helper'

module IssueNewUIModify
    module IssuesHelperPatch
        def self.included(base)
            base.send(:include, InstanceMethods)
            
            base.class_eval do 
                def l_hours(hours, project = nil)
                      hours = hours.to_f
                      
                      if !project.nil?
                        project.trackers.each do |tracker|
                            if tracker.name.to_s.strip == "TimeLog"
                                return l((:label_person_month), :value => ("%.2f" % hours.to_f))
                            end
                        end
                      end
                      
                      
                      return  time_str = l((:label_plugin_hours), :value => ("%.2f" % hours.to_f))            
                end           
            end
        end   
        
        module InstanceMethods
        end 
    
    end
    
end

IssuesHelper.send(:include, IssueNewUIModify::IssuesHelperPatch)



