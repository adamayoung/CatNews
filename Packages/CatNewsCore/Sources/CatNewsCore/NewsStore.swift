public protocol NewsStore {

    func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void)

    func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void)

}
