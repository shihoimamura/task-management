FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title' }
    content { 'test_content' }
    status { '未着手' }
    priority{ '高' }
    enddate{ '2023-3-29' }
  end
  factory :second_task, class: Task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test見積もり' }
    content { 'test作成' }
    status { '着手中' }
    priority{ '中' }
    enddate{ '2023-3-28' }
  end
  factory :third_task, class: Task do
    title { 'うさぎ' }
    content { 'プル' }
    status { '着手中' }
    priority{ '低' }
    enddate{ '2023-3-27' }

  end
end
