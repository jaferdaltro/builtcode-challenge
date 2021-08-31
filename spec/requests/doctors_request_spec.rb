require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  context "Get /doctors" do
    let!(:doctors) { create_list(:doctor, 10) }
    let(:url)  { "/doctors"}

    it "returns 10 doctors" do
      get url
      expect(doctors.count).to eq 10
    end
    
    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  context "Post /doctors" do
    let(:url)  { "/doctors"}
    let(:doctor_params) { {doctor: attributes_for(:doctor)}}
    it 'adds a new Doctor' do
      expect do
        post url, params: doctor_params
      end.to change(Doctor, :count).by(1)
    end
   
    it 'returns success status' do
      post url, params: doctor_params
      expect(response).to have_http_status(:found)
    end
    
  end

  context "Patch /doctors" do
    let(:url){ "/doctors/#{doctor.id}"}
    let(:doctor){create(:doctor)}
    let(:new_name){ 'doctor doctor'}
    let(:doctor_params) { {doctor: {name: new_name}}}
    
    it 'updates Doctor' do
      patch url, params: doctor_params
      doctor.reload
      expect(doctor.name).to eq new_name 
      
    end
   
    it 'returns success status' do
      patch url, params: doctor_params
      expect(response).to have_http_status(:found)
    end
  end

  context "DELETE /doctors/:id" do
    let!(:doctor) { create(:doctor) }
    let(:url) { "/doctors/#{doctor.id}" }

    it 'removes Doctor' do
      expect do  
        delete url
      end.to change(Doctor, :count).by(-1)
    end

    it 'if doctor has patient do not delete' do
      patient = create(:patient)
      appointment = create(:appointment, doctor_id: doctor.id, patient_id: patient.id)
      delete url
      expect(appointment.errors).to_not include(" Patient must exist, Doctor must exist")
    end

  end

end