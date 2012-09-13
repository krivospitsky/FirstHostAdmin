class MailboxesController < ApplicationController
  # GET /mailboxes
  # GET /mailboxes.json
  def index
    @mailboxes = Mailbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailboxes }
    end
  end

  # GET /mailboxes/1
  # GET /mailboxes/1.json
  def show
    @mailbox = Mailbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mailbox }
    end
  end

  # GET /mailboxes/new
  # GET /mailboxes/new.json
  def new
    @mailbox = Mailbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailbox }
    end
  end

  # GET /mailboxes/1/edit
  def edit
    @mailbox = Mailbox.find(params[:id])
  end

  # POST /mailboxes
  # POST /mailboxes.json
  def create
    @mailbox = Mailbox.new(params[:mailbox])

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to mailboxes_path, notice: 'Mailbox was successfully created.' }
        format.json { render json: @mailbox, status: :created, location: @mailbox }
      else
        format.html { render action: "new" }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mailboxes/1
  # PUT /mailboxes/1.json
  def update
    @mailbox = Mailbox.find(params[:id])

    respond_to do |format|
      if @mailbox.update_attributes(params[:mailbox])
        format.html { redirect_to mailboxes_path, notice: 'Mailbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailboxes/1
  # DELETE /mailboxes/1.json
  def destroy
    @mailbox = Mailbox.find(params[:id])
    @mailbox.destroy

    respond_to do |format|
      format.html { redirect_to mailboxes_url }
      format.json { head :no_content }
    end
  end
end
