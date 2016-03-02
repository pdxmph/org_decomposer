class GoalsController < ApplicationController

  def set_goal_priority
    @priority = params[:priority]
    @goal = Goal.find(params[:goal_id])
    @goal.priority = @priority

    if @goal.save
      respond_to do |format|
        format.js { render :action => 'update_priority_button.js.haml',
                           :locals => {:id => params[:goal_id],
                                       :priority => @goal.priority,
                                       :goal => @goal}}
        format.html 
      end
    end
  end

 def set_goal_frequency
    @frequency = params[:frequency]
    @goal = Goal.find(params[:goal_id])
    @goal.frequency = @frequency

    if @goal.save
      respond_to do |format|
        format.js { render :action => 'update_frequency_button.js.haml',
                           :locals => {:id => params[:goal_id],
                                       :frequency => @goal.frequency,
                                       :goal => @goal}}
        format.html 
      end
    end
 end

  def set_writer_coverage
    @writer_coverage = params[:writer_coverage]
    @goal = Goal.find(params[:goal_id])
    @goal.writer_coverage = @writer_coverage

    if @goal.save
      respond_to do |format|
        format.js { render :action => 'update_writer_coverage_button.js.haml',
                           :locals => {:id => params[:goal_id],
                                       :writer_coverage => @goal.writer_coverage,
                                       :goal => @goal}}
        format.html 
      end
    end
  end

  def set_goal_support
    @support = params[:support]
    @goal = Goal.find(params[:goal_id])
    @goal.support = @support

    if @goal.save
      respond_to do |format|
        format.js { render :action => 'update_support_button.js.haml',
                           :locals => {:id => params[:goal_id],
                                       :support => @goal.support,
                                       :goal => @goal}}
        format.html 
      end
    end
  end

  def destroy
    @goal = Goal.find(params[:id])

    if @goal.destroy
      respond_to do |format|
        format.html { redirect_to  organization_path(@goal.organization) }
      end
    else
      redirect_to @goal
    end
  end


  
end
