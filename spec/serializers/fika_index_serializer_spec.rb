describe Fikas::IndexSerializer, type: :serializer do
  let(:fika) { create(:fika) }

  let(:serialization) do
    ActiveModelSerializers::SerializableResource.new([fika], each_serializer: described_class)
  end

  subject { JSON.parse(serialization.to_json) }

  it 'is expected to wrap content in key reflecting model name' do
    expect(subject.keys).to match ['fikas']
  end

  it 'is expected to contain relevant keys' do
    expected_keys = %w[id start_date similarity participants]
    expect(subject['fikas'].last.keys).to match expected_keys
  end

  it 'is expected to have a specific structure' do
    expect(subject['fikas'].last).to match(
      {
        'id' => an_instance_of(Integer),
        'start_date' => an_instance_of(String),
        'similarity' => an_instance_of(Float),
        'participants' => an_instance_of(Array)
      }
    )
  end
end
