﻿<?php
    $time_left = time_left($offer['finalDate']);
    $hours = $time_left[0];
    $minutes = $time_left[1];
    $lessThenHour = ($hours < 1 && $minutes < 60);
    $lot_is_alive = ($hours >= 0 && $minutes >= 1);
?>
<?php if ($lot_is_alive) : ?>
    <li class="lots__item lot">
        <div class="lot__image">
            <img src="<?= htmlspecialchars($offer['image']); ?>" width="350" height="260" alt="<?= htmlspecialchars($offer['name']); ?>">
        </div>
        <div class="lot__info">
            <span class="lot__category"><?= htmlspecialchars($offer['categoty']); ?></span>
            <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= htmlspecialchars($offer['name']); ?></a></h3>
            <div class="lot__state">
                <div class="lot__rate">
                    <span class="lot__amount">Стартовая цена</span>
                    <span class="lot__cost"><?= htmlspecialchars(formatted_price($offer['price'])); ?></span>
                </div>
                <div class="lot__timer timer <?= ($lessThenHour) ? "timer--finishing" : "" ?>">
                    <?php print($hours . ':' . $minutes); ?>
                </div>
            </div>
        </div>
    </li>
<?php endif; ?>