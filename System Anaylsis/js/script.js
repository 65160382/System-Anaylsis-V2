
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}

function searchProducts() {
    const searchTerm = document.getElementById('search-bar').value.trim();
    if (!searchTerm) {
        alert('กรุณากรอกคำค้นหา');
        return;
    }

    // ซ่อนรายการ Daily Discover
    document.getElementById('daily-discover-container').style.display = 'none';

    // แสดงผลลัพธ์การค้นหา
    fetch(`http://localhost:3000/search?q=${encodeURIComponent(searchTerm)}`)
        .then(response => response.json())
        .then(data => {
            const resultsDiv = document.getElementById('search-results');
            resultsDiv.innerHTML = ''; // ล้างผลลัพธ์ก่อนหน้า
            if (data.length === 0) {
                resultsDiv.innerHTML = 'ไม่พบผลิตภัณฑ์';
            } else {
                data.forEach(product => {
                    const productDiv = document.createElement('div');
                    productDiv.className = 'product-item';

                    const image = document.createElement('img');
                    image.src = product.image; // แสดงภาพผลิตภัณฑ์
                    image.alt = product.name;
                    image.width = 150; // ขนาดภาพ
                    image.height = 150;

                    const name = document.createElement('h3');
                    name.textContent = product.name; // ชื่อผลิตภัณฑ์

                    const price = document.createElement('p');
                    price.textContent = `ราคา: ${product.price} บาท`; // ราคา

                    const description = document.createElement('p');
                    description.textContent = `รายละเอียด: ${product.description}`; // รายละเอียด

                    const stock = document.createElement('p');
                    stock.textContent = `สต๊อก: ${product.stock} ชิ้น`; // สต๊อกสินค้า

                    productDiv.appendChild(image);
                    productDiv.appendChild(name);
                    productDiv.appendChild(price);
                    productDiv.appendChild(description);
                    productDiv.appendChild(stock);

                    resultsDiv.appendChild(productDiv);
                });
            }
        })
        .catch(error => {
            console.error('เกิดข้อผิดพลาดในการค้นหาผลลัพธ์:', error);
        });
}





