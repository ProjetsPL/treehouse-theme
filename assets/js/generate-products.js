async function generateProducts(
  channel_id,
  channel_taxon_ids = [],
  size
) {
  const api_url =
    "https://api.wsf.tradesk.pl/v1/channel_products/fetch_random";

  function getUrlByChannelId(id) {
    switch (id) {
      case 1:
        return "https://instalguru.pl/";
      case 3:
        return "https://domee.pl/";
      case 5:
        return "https://instalguru.de/";
      case 6:
        return "https://domowezoo.pl/";
    }
  }

  function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1));
      var temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
    return array;
  }

  function updateElements(class_el, data) {
    const elements = document.querySelectorAll(
      `.${class_el}`
    );
    elements.forEach(function (el) {
      const link = `${getUrlByChannelId(
        channel_id
      )}sklep/p/${data.attributes.id}-${
        data.attributes.slug
      }`;
      el.href = link;

      if (data.attributes.image) {
        el.querySelector(".img-section .img").src =
          data.attributes.image;
      }
      el.querySelector(".desc-section .title").innerText =
        data.attributes.name;

      el.querySelector(
        ".desc-section .subtitle"
      ).innerText = data.attributes.properties
        .split(", ")
        .slice(0, 4)
        .join(", ");

      if (!!el.querySelector(".desc-section .content")) {
        el.querySelector(
          ".desc-section .content"
        ).innerText = data.attributes.description;
      }

      el.querySelector(
        ".footer .btn"
      ).innerText = `Kup od ${String(
        data.attributes.price
      ).replace(".", ",")} zł`;
    });
  }
  const all_data = await Promise.all(
    channel_taxon_ids.map(function (channel_taxon_id) {
      return new Promise(async function (resolve, reject) {
        try {
          const api_data = await fetch(
            `${api_url}?channel_id=${channel_id}&size=${size}&channel_taxon_id=${channel_taxon_id}`
          );
          const json = await api_data.json();
          resolve(json.data);
        } catch (error) {
          reject([]);
        }
      });
    })
  );

  let data = [];
  all_data.forEach(function (item) {
    item.forEach((e) => data.push(e));
  });
  if (data.length === 0) return;
  let data_index = 0;
  data = shuffleArray(data);

  const classes = [];
  const elements = document.querySelectorAll(
    'a[class*="item-product-"]'
  );

  elements.forEach(function (el) {
    const className = el.className.split(" ")[1];
    if (!classes.includes(className)) {
      classes.push(className);
    }
  });

  classes.forEach(function (class_el) {
    const element_data = data[data_index];
    updateElements(class_el, element_data);
    data_index =
      data_index + 1 >= data.length ? 0 : data_index + 1;
  });
}