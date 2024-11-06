document.addEventListener("DOMContentLoaded", function(){
    const counter = document.querySelector(".counter");
    async function updateCounter(){
        try {
            let response = await fetch("")
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