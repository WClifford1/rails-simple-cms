class SubjectsController < ApplicationController

    layout 'admin'

  # GET show all - view
  def index
    @subjects = Subject.sorted
  end

  # GET show one - view
  def show
    @subject = Subject.find(params[:id])
  end

  # GET form to create one - view
  def new
    @subject = Subject.new(:name => "Default")
    @subject_count = Subject.count + 1
  end

  # POST one - not a view
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
        flash[:notice] = "Subject created successfully"
        redirect_to(subjects_path)
    else
        @subject_count = Subject.count + 1
        render('new')
    end
  end

  # GET form to edit one - view
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  # PATCH edit one - not a view
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
        flash[:notice] = "Subject updated successfully"
        redirect_to(subjects_path(@subject))
    else
        @subject_count = Subject.count
        render('edit')
    end
  end

  # GET form to delete one - view
  def delete
    @subject = Subject.find(params[:id])

  end

  # DELETE to delete one - not a view
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :visible, :position, :created_at)
  end
end
