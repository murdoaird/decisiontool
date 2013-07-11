module SurveysHelper
  def build_survey (decision)
    String surveyOptions = ""
    #decision.id is the decision.id (confirmed)
    surveyOptions = "<table border=0>" 
    
    #does a previous survey exist
    @prev_survey = Survey.where(:decision_id => decision.id).order("id ASC")
    
    countRow = 0
    countX = 0
    for elementX in decision.elements
      countY = 0
      surveyOptions = surveyOptions + "<tr>"
      for elementY in decision.elements
        if elementX.name != elementY.name 
          if countX < countY
            surveyOptions = surveyOptions + "<tr><td>" + elementX.name + "</td>"
            checked_val = 0
            #now as we build the 9 radio buttons, check to find the previous value of the radio button
            for prev_surv in @prev_survey
              if (elementX.id == prev_surv.a_element_id) and (elementY.id  == prev_surv.b_element_id)
                #get a_value
                case prev_surv.a_value
                  when "9"
                    checked_val = 1
                  when "7"
                    checked_val = 2
                  when "5"
                    checked_val = 3
                  when "3"
                    checked_val = 4 
                  when "1"
                    checked_val = 5 
                  when "1/3"
                    checked_val = 6
                  when "1/5"
                    checked_val = 7
                  when "1/7"
                    checked_val = 8
                  when "1/9"
                    checked_val = 9
                end 
                break
              end
            end
              
            for i in 1..9
              checked = ""
              if i == checked_val 
                checked = "checked='checked'"
              end
              surveyOptions = surveyOptions + "<td><input type='radio' name='opt_" + countRow.to_s + "' " + checked + " value='" + i.to_s + " " + elementX.id.to_s + " " + elementY.id.to_s + "'><br></td><td>&nbsp;</td>"
            end
            countRow += 1
            surveyOptions = surveyOptions + "<td>" + elementY.name + "</td></tr>"
          end
        end
        countY += 1
      end
      surveyOptions = surveyOptions + "</tr>"
      countX += 1
    end  
    surveyOptions = surveyOptions + "</table>"  
    return surveyOptions.html_safe
  end
end
