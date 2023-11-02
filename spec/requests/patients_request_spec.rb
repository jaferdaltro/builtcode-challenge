require 'rails_helper'

RSpec.describe "Patients", type: :request do

  describe "GET /patients" do
    let!(:patients){create_list(:patient, 10)}
    let(:url) {"/patients"}

    it "returns 10 patients" do
      get url
      expect(patients.count).to eq 10
    end
  end

  context "Post /patients" do
    let(:url)  { "/patients"}
    let(:patient_params) { {patient: attributes_for(:patient)}}
    it 'adds a new patient' do
      expect do
        post url, params: patient_params
      end.to change(Patient, :count).by(1)
    end
   
    it 'returns success status' do
      post url, params: patient_params
      expect(response).to have_http_status(:found)
    end
    
  end

  context "Patch /patients" do
    let(:url){ "/patients/#{patient.id}"}
    let(:patient){create(:patient)}
    let(:new_name){ 'patient patient'}
    let(:patient_params) { {patient: {name: new_name}}}
    
    it 'updates patient' do
      patch url, params: patient_params
      patient.reload
      expect(patient.name).to eq new_name 
      
    end
   
    it 'returns success status' do
      patch url, params: patient_params
      expect(response).to have_http_status(:found)
    end
  end

  context "DELETE /patients/:id" do
    let!(:patient) { create(:patient) }
    let(:url) { "/patients/#{patient.id}" }

    it 'removes patient' do
      expect do  
        delete url
      end.to change(Patient, :count).by(-1)
    end

    it 'if patient has patient do not delete' do
      patient = create(:patient)
      appointment = create(:appointment, patient_id: patient.id)
      delete url
      expect(appointment.errors).to_not include(" Patient must exist, patient must exist")
    end

  end

end
