module BundleHelper
  BUNDLE_STATE_CLASSES = {
    'draft'     => 'badge-secondary',
    'published' => 'badge-success',
    'privated'  => 'badge-warning'
  }

  def bundle_state_collection
    Bundle.workflow_spec.states.keys.map do |state|
      [bundle_state_translate(state), state]
    end
  end

  def bundle_state_translate(state)
    t state, scope: [:bundle, :states]
  end

  def bundle_state_humanized(state)
    content_tag :span, bundle_state_translate(state), class: [:badge, BUNDLE_STATE_CLASSES[state]].join(' ')
  end
end
