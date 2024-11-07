document.addEventListener("DOMContentLoaded", function(){
    const counter = document.querySelector(".counter");
    async function updateCounter(){
        try {
            let response = await fetch("https://a8fu2b1awh.execute-api.ap-south-1.amazonaws.com/count")
            let data = await response.json();
            console.log('Count:', data);
            counter.innerHTML = data;
        } catch (error) {
            console.error(error);
        }
    }
    console.log()
    updateCounter();
});