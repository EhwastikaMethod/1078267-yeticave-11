<section class="promo">
    <h2 class="promo__title">Нужен стафф для катки?</h2>
    <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
    <ul class="promo__list">
        <!--заполните этот список из массива категорий-->
        <?php
        $index= 0;
        $count=count($categories);
        while ($index < $count): ?>
            <li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html"><?=htmlspecialchars($categories[$index]); ?></a>
            </li>
            <?php $index ++; ?>
        <?php endwhile; ?>
    </ul>
</section>
<section class="lots">
    <div class="lots__header">
        <h2>Открытые лоты</h2>
    </div>
    <ul class="lots__list">
        <!--заполните этот список из массива с товарами-->
        <?php foreach ($items as $offer): ?>
        <?= include_template('_offer.php', ['offer' => $offer]); ?>
    <?php endforeach; ?>
    </ul>
</section>
