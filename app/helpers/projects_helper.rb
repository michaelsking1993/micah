module ProjectsHelper

  def sort_tasks(features)
    done_features, in_progress_features = [], []
    features.each{|feature| feature.done ? done_features.push(feature) : in_progress_features.push(feature)}

    done_features.sort_by!(&:created_at)
    in_progress_features.sort_by!(&:created_at)

    in_progress_features + done_features
  end
end
