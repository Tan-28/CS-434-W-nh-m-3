function showContent(id) {
    const contents = document.querySelectorAll('.content');
    contents.forEach(content => content.classList.add('hidden'));
    
    const selectedContent = document.getElementById(id);
    if (selectedContent) {
        selectedContent.classList.remove('hidden');
    }
}
